PASSWORD = 'opensaysme'

# Users
User.delete_all
head_hunter = User.create(:name => 'Adam Head Hunter', :email => 'head_hunter@test.com', :password => PASSWORD)
programmer = User.create(:name => 'Bill Programmer', :email => 'programmer@test.com', :password => PASSWORD)
consultant = User.create(:name => 'Charlie Consultant', :email => 'consultant@test.com', :password => PASSWORD)
manager = User.create(:name => 'Mike Manager', :email => 'manager@test.com', :password => PASSWORD)

# Job Posts
JobPost.delete_all
head_hunter_posts_manager = JobPost.create(
  :user => head_hunter,
  :title => 'Manager of Engineering',
  :company => 'Sprockets Inc.',
  :description => <<EOS
You will be the director of engineering. You must inspire your
team to make the best software ever.  This daunting task is yours.  Embrace it.

Responsibilities:
1. Insuring product quaility.
2. Motivational fireside chats.
3. Quarterly reports.

Requirements:
1. Must be able to play sub 100 golf with the CEO and clients.
EOS
)

head_hunter_posts_programer = JobPost.create(
  :user => head_hunter,
  :title => 'Programer Level 2',
  :company => 'Sprockets Inc.',
  :description => <<EOS
Seeking talented engineer who would rather code than bother with anything else.
Must be pationate about designing, testing, and refactoring.

Responsibilities:
1. Write an test code.
2. Make sure the servers don't melt down.
3. Code review junior programmers.

Requirements:
1. Absolute minimum 3 years experience with Rails.
2. Must be able to create an x86 compiler from scratch with an abacus.
3. Must produce a github account with an algorithm for matrix multiplication that
is more efficient than O(n^3).
EOS
)

programmer_posts_consultant = JobPost.create(
  :user => programmer,
  :title => 'Startup Consultant',
  :company => 'Future Widget',
  :description => <<EOS
Geeks with excellent startup idea seeking business consultant.  Come sign an NDA,
and we will tell you about an idea that will change the world.

Responsibilities:
1. Draft business plan.
2. Court VCs.
3. Come up with amazing ways to market.

Requirements:
1. Must have proven track record of successful startups.
2. Must be able to play sub 100 golf with the CEO and clients.
EOS
)

# Job Responses
JobResponse.delete_all
 
  programmer_applies_for_programmer = JobResponse.create(
  :user => programmer,
  :job_post => head_hunter_posts_programer,
  :response => (<<EOS
I am a total Sprockets fan boy.  I would work this job for peanuts
despite the fact that I have a PhD. Please hire me so I can move out of my
mom's basement.
EOS
  ),
  :resume => <<EOS
Work Experience:
4 years with IBM
2 years with UberSoft

Education:
NCSU MS MBA
NCSU BA
EOS
)

programmer_applies_for_manager = JobResponse.create(
  :user => programmer,
  :job_post => head_hunter_posts_manager,
  :response => (<<EOS
Dear Hiring Manager:

I am trying to branch out and teach others how to have coding prowess.  I can instruct
others to become amazing coders just like me.  I am the only person to ever deliver
all software projects on time.

Sincerly,
Bill Programmer
EOS
  ),
  :resume => <<EOS
Work Experience:
4 years with IBM
2 years with UberSoft

Education:
NCSU MS MBA
NCSU BA
EOS
)

manager_applies_for_manager = JobResponse.create(
  :user => manager,
  :job_post => head_hunter_posts_manager,
  :response => (<<EOS
Dear Hiring Manager:

I have a proven track record of managing.  My employees like me, and my CEO
likes me even more because I keep the employees happy on pennies on the dollar.

Sincerly,
Mike Manager
EOS
  ),
  :resume => <<EOS
Education:
Harvard MBA
Princeton BA
Wayne Thoroughton Finishing School
EOS
)


consultant_applies_for_consultant = JobResponse.create(
  :user => consultant,
  :job_post => programmer_posts_consultant,
  :response => (<<EOS
I am a total Sprockets fan boy.  I would work this job for peanuts
despite the fact that I have a PhD. Please hire me so I can move out of my
mom's basement.
EOS
  ),
  :resume => <<EOS
Work Experience:
2 Years with Facebook
4 Years with Google
5 Years with Microsoft
EOS
)