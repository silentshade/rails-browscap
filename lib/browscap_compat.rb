#browscap-0.1.0 does not use the encoding option, monkey patch it waiting for native support
class Browscap

  def initialize(filename = 'browscap.ini', encoding='ISO-8859-1')
    @@user_agent_properties ||= {}
    @@user_agent_regexps    ||= {}
    @@match_cache           ||= {}

    if @@user_agent_properties.empty? || @@user_agent_regexps.empty?

      ###patch use encoding with inifile 0.4.0
      ini = IniFile.load(filename, {:encoding => encoding})

      # Remote meta sections
      ini.delete_section '*'
      ini.delete_section 'GJK_Browscap_Version'

      # Create a list of non-parent sections
      child_sections = ini.sections.dup
      ini.sections.each do |section|
        child_sections.delete ini[section]["Parent"]
      end

      # Populate user_agent_properties and user_agent_regexps
      child_sections.each do |section|
        properties = _get_browser_props(ini, section)

        browser = Browser.new
        browser.browser               = properties['Browser']
        browser.version               = properties['Version']
        browser.major_ver             = properties['MajorVer'].to_i
        browser.minor_ver             = properties['MinorVer'].to_i
        browser.platform              = properties['Platform']
        browser.alpha                 = properties['Alpha'].downcase == 'true'
        browser.beta                  = properties['Beta'].downcase == 'true'
        browser.win16                 = properties['Win16'].downcase == 'true'
        browser.win32                 = properties['Win32'].downcase == 'true'
        browser.win64                 = properties['Win64'].downcase == 'true'
        browser.frames                = properties['Frames'].downcase == 'true'
        browser.iframes               = properties['IFrames'].downcase == 'true'
        browser.tables                = properties['Tables'].downcase == 'true'
        browser.cookies               = properties['Cookies'].downcase == 'true'
        browser.background_sounds     = properties['BackgroundSounds'].downcase == 'true'
        browser.javascript            = properties['JavaScript'].downcase == 'true'
        browser.vbscript              = properties['VBScript'].downcase == 'true'
        browser.java_applets          = properties['JavaApplets'].downcase == 'true'
        browser.activex_controls      = properties['ActiveXControls'].downcase == 'true'
        browser.is_banned             = properties['isBanned'].downcase == 'true'
        browser.is_mobile_device      = properties['isMobileDevice'].downcase == 'true'
        browser.is_syndication_reader = properties['isSyndicationReader'].downcase == 'true'
        browser.crawler               = properties['Crawler'].downcase == 'true'
        browser.css_version           = properties['CssVersion'].to_i
        # We can get a nil here, so just rely on CssVersion
        browser.supports_css          = properties['CssVersion'].to_i > 0 ? 'true' : false
        browser.aol_version           = properties['aolVersion'].to_i
        browser.aol                   = properties['AOL'].downcase == 'true'

        @@user_agent_properties[section] = browser

        # Convert .ini file regexp syntax into ruby regexp syntax
        regexp = section.dup
        regexp.gsub! /([\^\$\(\)\[\]\.\-])/, "\\\\\\1"
        regexp.gsub! "?", "."
        regexp.gsub! "*", ".*?"

        ###patch, use encoding
        if RUBY_VERSION < '1.9'
          @@user_agent_regexps[section] = Regexp.new(("^%s$" % regexp))
        else
          @@user_agent_regexps[section] = Regexp.new(("^%s$" % regexp).force_encoding(encoding))
        end
      end
    end
  end
end