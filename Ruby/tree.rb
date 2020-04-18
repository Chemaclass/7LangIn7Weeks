class Tree
  attr_accessor :node_name, :children

  def initialize(name, children = [])
    @node_name = name
    @children = children
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end

  def visit(&block)
    block.call self
  end

end

tree = Tree.new('Ruby', [
    Tree.new('Reia'),
    Tree.new('MacRuby')
])

puts 'Visiting a node'
tree.visit { |n| puts n.node_name }
puts

puts 'visiting entire tree'
tree.visit_all { |n| puts n.node_name }
