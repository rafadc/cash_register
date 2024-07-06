# frozen_string_literal: true

require 'yaml'
require 'zeitwerk'

loader = Zeitwerk::Loader.new
loader.push_dir('src/models')
loader.push_dir('src/')
loader.ignore('spec')
loader.setup
