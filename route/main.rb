# encoding: utf-8

class ElvenHut < Sinatra::Application

  get "/" do 
    if File.exist?(File.join(settings.view_path,"my_index.erb"))
      erb :my_index, :locals=>{:articles=>Article.reverse_order(:created_at).limit(8)}
    else
      markdown :index, :layout => :background
    end
  end

  get "/about" do
    erb :about, :layout => :background
  end

  get "/project" do
    project_tag = Tag.filter(:name => "project").first
    if project_tag != nil
      @all = project_tag.articles.sort{ |x, y| (y.created_at || nil) <=> (x.created_at || nil)}
      erb :archives_index, :layout => :background
    end
  end

  not_found do
    markdown File.read(File.join(settings.public_path, "not_found.md")), :layout => :background
  end

end
