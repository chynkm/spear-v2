require 'digest'

module SpearWeb
  module Helpers
    module ApplicationHelper

      def relative_to_root(*paths)
        File.expand_path(File.join(root, *paths), __FILE__)
      end

      def title
        @title ? @title+' - Spear' : 'Spear'
      end

      def active_menu(urls)
        ' active' if urls.include?request.path
      end

      def project_name
        'Spear'
      end

      def host
        request.host_with_port + root_path
      end

      def site_root
        host
      end

      def root_path
        '/'
      end

      def h(value)
        Rack::Utils.escape_html value
      end

      def link_to(path)
        File.join(root_path, path)
      end

      def css_url(filenames)
        css = filenames.collect do |filename|
          filepath = settings.public_folder+'/css/'+filename
          '<link href="/css/'+filename+'?v='+Digest::MD5.new.file(filepath).to_s+'" rel="stylesheet" type="text/css"/>'
        end
        css.join
      end

      def js_url(filenames)
        js = filenames.collect do |filename|
          filepath = settings.public_folder+'/js/'+filename
          '<script type="text/javascript" src="/js/'+filename+'?v='+Digest::MD5.new.file(filepath).to_s+'"></script>'
        end
        js.join
      end
      def csrf_token
        Rack::Csrf.csrf_token(env)
      end

      def csrf_tag
        Rack::Csrf.csrf_tag(env)
      end

      def save_form_data_to_flash(params)
        params.each do |key, value|
          flash[key.to_sym] = value
        end
      end

      def paginate(collection)
        options = {
          inner_window: 1,
          outer_window: 1,
          previous_label: '&laquo;',
          next_label: '&raquo;',
        }
        will_paginate collection, options
      end

    end
  end
end