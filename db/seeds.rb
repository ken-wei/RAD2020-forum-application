# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Topic.create(name: "News")
Topic.create(name: "A.I.")
Topic.create(name: "V.R.")
Topic.create(name: "Game")
Topic.create(name: "Rails")
Topic.create(name: "Go")
Topic.create(name: "Web")
Topic.create(name: "M.L.")
Topic.create(name: "Joke")
Topic.create(name: "React")
Topic.create(name: "RMIT")
Topic.create(name: "Vue")
Topic.create(name: "Node")
Topic.create(name: "iOS")
Topic.create(name: "AWS")

User.create({email: "rad2020rmit@gmail.com", password: "Rails2020", password_confirmation: "Rails2020", mobile: "0123456789", last_login: Time.now, username: "RAD", city: "Melbourne"})
User.create({email: "andy@gmail.com", password: "password", password_confirmation: "password", mobile: "012344456789", last_login: Time.now, username: "Andy", city: "Melbourne"})
User.create({email: "ken@gmail.com", password: "password", password_confirmation: "password", mobile: "012345611789", last_login: Time.now, username: "Ken", city: "Sydney"})
User.create({email: "jeremy@gmail.com", password: "password", password_confirmation: "password", mobile: "01235546789", last_login: Time.now, username: "Jeremy", city: "Brisbane"})
User.create({email: "alexander@gmail.com", password: "password", password_confirmation: "password", mobile: "013323456789", last_login: Time.now, username: "Andy", city: "Korea"})
User.create({email: "alex@gmail.com", password: "password", password_confirmation: "password", mobile: "012345343789", last_login: Time.now, username: "Alex", city: "Japan"})
User.create({email: "ryan16@gmail.com", password: "password", password_confirmation: "password", mobile: "0323236789", last_login: Time.now, username: "Ryan", city: "China"})
User.create({email: "peter@gmail.com", password: "password", password_confirmation: "password", mobile: "0123456789", last_login: Time.now, username: "Peter", city: "India"})
User.create({email: "paul@gmail.com", password: "password", password_confirmation: "password", mobile: "63281392399", last_login: Time.now, username: "Paul", city: "Singapore"})
User.create({email: "jessica@gmail.com", password: "password", password_confirmation: "password", mobile: "0123456789", last_login: Time.now, username: "Jessica", city: "Malaysia"})
User.create({email: "john@gmail.com", password: "password", password_confirmation: "password", mobile: "01234565689", last_login: Time.now, username: "John", city: "Japan"})
User.create({email: "michael@gmail.com", password: "password", password_confirmation: "password", mobile: "012133456789", last_login: Time.now, username: "Michael", city: "Australia"})

Post.create({title: "Walmart Gets Into Health Care",
             content: "Walmart understood the growing demand and lack of knowledge surrounding obesity, chronic disease prevalence and health literacy across the United States. They knew that by 2020, nearly 20% of the US GDP is projected to be spent on healthcare and saw an opportunity to make an impact in healthcare while catering to the 150 million consumers that walked through their stores every week.",
             user_id: 1,
             topic_id: 1,
             view: 150})

Post.create({title: "Mathematics for the Adventurous Self-Learner",
            content: "For over six years now, I've been studying mathematics on my own in my spare time - working my way through books, exercises, and online courses. In this post I'll share what books and resources I've worked through and recommend and also tips for anyone who wants to go on a similar adventure.

            Self-studying mathematics is hard - it's an emotional journey as much as an intellectual one and it's the kind of journey I imagine many people start but then drop off after a few months. So I also share (at the end) the practices and mindset that have for me allowed this hobby to continue through the inevitable ups and downs of life (raising two young boys, working at a startup, and moving states!)",
            user_id: 2,
            topic_id: 2,
            view: 350})

Post.create({title: "China bans consumption and trade of wild animals",
            content: "China this week announced a permanent ban on wildlife trade and consumption that international conservationists greeted as a major step, but one with troublesome loopholes for trade in wild animals for medicinal uses.",
            user_id: 1,
            topic_id: 1,
            view: 565})

Post.create({title: "Covid19 Info",
            content: "The Australian Government is establishing GP respiratory clinics around the country to assess people with fever, cough, a sore throat, or shortness of breath.",
            user_id: 4,
            topic_id: 1,
            view: 1320})

Post.create({title: "Worried about AI taking over the world? You may be making some rather unscientific assumptions",
            content: "Should we be afraid of artificial intelligence? For me, this is a simple question with an even simpler, two letter answer: no. But not everyone agrees – many people, including the late physicist Stephen Hawking, have raised concerns that the rise of powerful AI systems could spell the end for humanity.",
            user_id: 10,
            topic_id: 2,
            view: 1006})

Post.create({title: "RMIT set to lead an innovative European Training Network for industrial digital transformation",
            content: "The new PhD program is expected to produce a new generation of high performing early stage researchers in innovation and technology management able to embrace the major challenges of future industrial systems.",
            user_id: 3,
            topic_id: 11,
            view: 923})

Comment.create({content: "That's cool! I wish that i can know more about that!", user_id: 3, post_id: 1})
Comment.create({content: "Where can i get more information about this?", user_id: 6, post_id: 1})
Comment.create({content: "Wow that's amazing!", user_id: 9, post_id: 1})
Comment.create({content: "This could help the medical industry..", user_id: 11, post_id: 1})
Comment.create({content: "I hope that pandemic will be over sooner.", user_id: 7, post_id: 3})
Comment.create({content: "That's cool! Everyone could get tested.", user_id: 4, post_id: 4})
Comment.create({content: "Is there a list of the clinics?", user_id: 7, post_id: 4})
Comment.create({content: "Yes, you can find them online.", user_id: 8, post_id: 4})
Comment.create({content: "Thanks!", user_id: 7, post_id: 4})
Comment.create({content: "Is it free?", user_id: 3, post_id: 1})
Comment.create({content: "I wish i have free time to study something extra during my free time..", user_id: 10, post_id: 2})
Comment.create({content: "Now does that make the AI Go player smarter than a human? Certainly not. AI is very specialised to particular type of tasks and it doesn’t display the versatility that humans do. Humans develop an understanding of the world over years that no AI has achieved or seem likely to achieve anytime soon.", user_id: 5, post_id: 5})
Comment.create({content: "I agree! Humans are way smarter as they created AI.", user_id: 4, post_id: 5})
Comment.create({content: "Wow, If successful, the consortium consisting of six European academic partners and 15 industry partners and coordinated by RMIT Europe will be awarded a total value of €4M.", user_id: 12, post_id: 6})
Comment.create({content: "the project aims to develop new concepts, approaches and methods in the area of digital transformation and brings together a unique group of world-leading experts", user_id: 1, post_id: 6})
