sudo apt-get update
sudo apt-get install -y git
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
rm get-pip.py
cd /home/vagrant/app
pip install -U .
