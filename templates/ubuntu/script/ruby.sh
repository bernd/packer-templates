# Install Ruby from source in /opt so that users of Vagrant
# can install their own Rubies using packages or however.

# Ruby dependencies
apt-get -y install g++ gcc make libc6-dev patch openssl ca-certificates \
	libreadline6-dev curl zlib1g-dev libssl-dev libyaml-dev \
	libsqlite3-dev sqlite3 autoconf wget lsb-release \
	libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev

# Install Ruby
wget http://ftp.ruby-lang.org/pub/ruby/${RUBY_VERSION%.*}/ruby-$RUBY_VERSION.tar.gz
tar xvzf ruby-$RUBY_VERSION.tar.gz
cd ruby-$RUBY_VERSION
if [ $(lsb_release -s -r) = "14.04" ]; then
	wget https://gist.github.com/mislav/a18b9d7f0dc5b9efc162.txt
	patch -p0 < a18b9d7f0dc5b9efc162.txt
fi
./configure --prefix=/opt/ruby
make
make install
cd ..
rm -rf ruby-$RUBY_VERSION

# Install RubyGems
wget http://production.cf.rubygems.org/rubygems/rubygems-$RUBYGEMS_VERSION.tgz
tar xzf rubygems-$RUBYGEMS_VERSION.tgz
cd rubygems-$RUBYGEMS_VERSION
/opt/ruby/bin/ruby setup.rb
cd ..
rm -rf rubygems-$RUBYGEMS_VERSION

# Add /opt/ruby/bin to the global path as the last resort so
# Ruby, RubyGems, and Puppet are visible
echo 'PATH=$PATH:/opt/ruby/bin'> /etc/profile.d/vagrantruby.sh
