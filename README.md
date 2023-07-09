# README

git push origin main
git push heroku main
heroku run rake db:migrate
heroku run rails console
-> User.create! email: 'admin@gmail.com', password: 'admin@gmail.com'

link: https://rails-7-andrews-menu-app-e5f557ba9b42.herokuapp.com
admin link: https://rails-7-andrews-menu-app-e5f557ba9b42.herokuapp.com/?admin/pdf_files
email: admin@gmail.com
password: admin@gmail.com

logs: heroku logs --tail

I have used amazon s3 bucket to store pdfs

# get credentials

# edit/create
EDITOR="nano" rails credentials:edit
# show
rails credentials:show

config/credentials.yml.enc - encrypted file
/config/master.key - file contains key for decryption should not be pushed to git! 