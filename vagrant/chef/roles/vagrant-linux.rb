# Name of the role should match the name of the file
name 'vagrant-linux'

# Run list to provision
run_list(
    'recipe[apache2]',
    'recipe[php]',
    'recipe[mysql]',
    'recipe[nodejs]'
)