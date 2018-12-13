module Jekyll

  class NavigationGenerator < Generator
    safe true
    ## See post.dir and post.base for directory information.
    def generate(site)
      site.pages.each do |page|
        path_parts = page.path.split("/")
        filename = path_parts.pop()
        basename = File.basename(filename, File.extname(filename))
        if basename != "index" then
          path_parts.push(basename)
        end
        id = path_parts.join("/")
        parents = path_parts[0..-2]
        parent = parents.empty? ? nil : parents.join("/")
        parent_ancestry = parents.reduce([]) {|acc, p| acc.push(acc.clone.flatten.push(p))}.map { |p| p.join("/") }
        page.data["nav_id"] = id
        page.data["nav_parent"] = parent
        page.data["nav_parent_ancestry"] = parent_ancestry
      end
    end
  end

end
