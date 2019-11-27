class LinkedList
    attr_accessor :head, :tail, :size
    
    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end

    def append(str = nil)
        #adds a node at the end of the list

        n = Node.new(str)
        @tail.link = n if @tail
        @head = n unless @head
        @tail = n
        @size += 1

    end

    def prepend(str = nil)
        #adds a node at the start of the list

        n = Node.new(str)
        n.link = @head if @head
        @tail = n unless @tail
        @head = n
        @size += 1

    end

    def at(idx)
        #returns the node at a given index
        return "ERROR: Index outside bounds of Linked List" if idx > @size - 1 || idx < 0
        n = @head

        idx.times do 
            n = n.link
        end
        n

    end

    def pop
        #removes the last element from the list
        
        if @size > 1
            new_tail = self.at(@size-2)
            new_tail.link = nil
            @tail = new_tail
            @size -= 1
        elsif @size > 0
            @head = nil
            @tail = nil
            @size -= 1
        else
            return "ERROR: Cannot remove an element from a Linked List with 0 nodes"
        end

    end

    def contains?(str)
        #returns true if the passed in value is in the list. Otherwise false
        
        n = @head
        while n != nil
            return true if n.value == str
            n = n.link
        end
        false

    end

    def find(str)
        #returns the index of the node containing data, or nil if not found

        idx = 0
        n = @head
        while n != nil
            return idx if n.value == str
            n = n.link
            idx += 1
        end
        nil
    end

    def to_s
        #represents the Linked List object as a string.
        #format should be (data) -> (data) -> (data) -> nil

        str = ""
        n = @head
        while n != nil
            str += "( #{n.value} ) -> "
            n = n.link
        end
        return str += "nil"

    end

    #optional methods
    def insert_at(idx, str = nil)
        #inserts a node at a given index
        if idx > @size - 1 || idx < 0
            puts "ERROR: Index outside bounds of Linked List"
        elsif idx == 0
            self.prepend(str)
        else
            prev_n = self.at(idx-1)
            next_n = self.at(idx)
            
            n = Node.new(str)

            prev_n.link = n
            n.link = next_n
            @size += 1
        end

    end

    def remove_at(idx)
        #removes a node at a given index
        if idx > @size - 1 || idx < 0
            puts "ERROR: Index outside bounds of Linked List"
        elsif idx == 0
            if @size == 1
                @head = nil
                @tail = nil
            else
                next_n = self.at(1)
                @head.link = nil
                @head = next_n
            end
            @size -= 1
        elsif idx == @size-1
            prev_n = self.at(@size-2)
            prev_n.link = nil
            @tail = prev_n
            @size -= 1
        else
            prev_n = self.at(idx-1)
            next_n = self.at(idx+1)
    
            prev_n.link = next_n
            @size -= 1
        end
    end

end

class Node
    attr_accessor :value, :link

    def initialize(str = nil, node = nil)
        @value = str
        @link = node
    end

end

system "clear"

$ll = LinkedList.new
$ll.append("initial")
$ll.append("appended")
$ll.append("last")
$ll.prepend("first")