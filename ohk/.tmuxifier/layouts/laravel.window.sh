new_window "Devtools Laravel"
split_v 50
run_cmd "php artisan serve"
split_h 50
run_cmd "mailhog"
select_pane 0
split_h 50
run_cmd "npm run watch"
select_pane 0
run_cmd "phpstan"
