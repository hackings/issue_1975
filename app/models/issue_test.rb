class IssueTest

  def self.test_me
    Member.delete_all
    Post.delete_all
    member = Member.create(:name => "Karunakar")
    2.times do |i|
      member.posts.create(:title => "Rails contributor #{i}")
    end


    member = Member.first


    puts "I am older post"
    puts Post.first.title


    member.attributes = {
      :posts_attributes => [
        { :id => Post.first.id, :title => '[UPDATED] An, as of yet, undisclosed awesome Ruby documentation browser!' },
        { :id => Post.last.id, :title => '[UPDATED] other post' }
    ]
    }
    
    puts "I am a member and my changed? is #{member.changed?}"
    member.save

    puts "I am New post"
    puts Post.first.title
    
    puts "Printing all the posts"
    Post.all.each do |post|
      puts post.title
    end  
  end
end
