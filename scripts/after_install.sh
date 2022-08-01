# Install libaries
pip3 install -r requirements.txt -y
# Build React app
npm run build --prefix ./djangobackend/reactfrontend
# Migrate database
python3 djangobackend/manage.py migrate
