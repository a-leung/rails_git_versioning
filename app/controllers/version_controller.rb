class VersionController < ApplicationController

  def index

    branch = `cat .git/HEAD | awk '{ print $2 }'`.strip.split('/')[2..-1].join('/')
    sha = `cat .git/HEAD | awk '{ print $2 }' | xargs -I % sh -c 'cat .git/%'`.strip

    version = {
      branch: branch,
      sha:    sha
    }

    render json: version
  end

end
