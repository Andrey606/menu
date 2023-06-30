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