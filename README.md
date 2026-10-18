# Just a Simple Personal Website
Right now, I'm just looking to make a static html webpage for my resume and job fairs. After all, I'm not super interested in frontend Web Dev (biggest reason I'm motivated to make this is so I can pretend to be a SysAdmin configuring my Oracle VPS).
Maybe I'll use a fancy JS framework in the future, after
1. a couple other personal projects
2. making my arch linux setup more aesthetic
3. world domination

# Tech Stack I Used
- Oracle Always Free Tier VPS
- Ubuntu Minimal 26.04 (would've used debian but cant with the always free tier)
So, I tested my little install script from a fresh install using these, but I can't say anything else works
just in case anyone wanted to host my website for me :)

# Installation

In Oracle's Cloud dashboard, under security rules for your instance's VCN, make sure
Ingress rules allow Destination Ports 80 & 443 to have all incoming Source Port traffic

curl -fsSL https://github.com/smileytheduck51/Personal-Site/install.sh | sh

That's it. I really wanted to do a one command install because Oracle has been known to randomly revoke access to their Free VPS instances. I figured documenting everything in an install.sh was cooler and less work than creating a backup with rsync.

