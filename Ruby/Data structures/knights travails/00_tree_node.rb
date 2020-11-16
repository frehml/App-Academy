class PolyTreeNode
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end
    def parent
        @parent
    end
    def children
        @children
    end
    def value
        @value
    end
    def parent=(new_parent)
        @parent.children.delete(self) if !@parent.nil?
        @parent = new_parent
        @parent.children << self if !@parent.nil? && !@parent.children.include?(self)
    end
    def add_child(child)
        child.parent=(self)
    end
    def remove_child(child)
        raise if !self.children.include?(child)
        child.parent=(nil)
        return child
    end
    def dfs(target_value)
        return self if @value == target_value
        @children.each do |child|
            search_result = child.dfs(target_value)
            return search_result unless search_result.nil?
        end
        nil
    end
    def bfs(target_value)
        array = [self]
        until array.empty?
            el = array.shift
            return el if el.value == target_value
            array += el.children 
        end
    end
end