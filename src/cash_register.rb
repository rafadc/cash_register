# frozen_string_literal: true

require 'zeitwerk'

loader = Zeitwerk::Loader.new
loader.push_dir('src/models')
loader.ignore('spec')
loader.setup
