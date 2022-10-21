require 'json'

module FileHandler
  def
      write_json(array, file_name)
    return unless File.exist?(file_name)

    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    File.write(file_name, JSON.pretty_generate(array, opts))
  end

  def read_json(file_name)
    file = File.read(file_name)
    JSON.parse(file)
  end
end
