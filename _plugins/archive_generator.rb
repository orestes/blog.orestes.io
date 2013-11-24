module Jekyll

  class ArchivePage < Page
    def initialize(site, base, dir, year, month, archive)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'month_index.html')

      self.data['year']       = year
      self.data['month']      = month
      self.data['archive']    = archive
      self.data['post_count'] = archive.length

    end
  end

  class ArchivePageGenerator < Generator
    safe true

    def generate(site)
      archive = {}
      site.posts.each do |post|
        y = post.date.year.to_s
        m = "%02d" % post.date.month.to_i

        archive[y] ||= {}
        archive[y][m] ||= []
        archive[y][m] << post
      end

      if site.layouts.key? 'month_index'
        dir = site.config['archive_dir'] || 'archive'

        archive.keys.each do |year|
          archive[year].keys.each do |month|
            site.pages << ArchivePage.new(site, site.source, File.join(dir, year, month), year, month, archive[year][month])
          end
        end
      else
        puts 'Missing month_index layout'
      end

    end # /generate
  end # /ArchivePageGenerator

end