# Autogenerated from a Treetop grammar. Edits may be lost.


module Procedo
  module HandlerMethod
    include Treetop::Runtime

    def root
      @root ||= :expression
    end

    def _nt_expression
      start_index = index
      if node_cache[:expression].has_key?(index)
        cached = node_cache[:expression][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0 = index
      r1 = _nt_multiplication
      if r1
        r0 = r1
      else
        r2 = _nt_addition
        if r2
          r0 = r2
        else
          r3 = _nt_division
          if r3
            r0 = r3
          else
            r4 = _nt_substraction
            if r4
              r0 = r4
            else
              r5 = _nt_variable
              if r5
                r0 = r5
              else
                @index = i0
                r0 = nil
              end
            end
          end
        end
      end

      node_cache[:expression][start_index] = r0

      r0
    end

    module Multiplication0
      def operand1
        elements[0]
      end

      def operand2
        elements[2]
      end
    end

    def _nt_multiplication
      start_index = index
      if node_cache[:multiplication].has_key?(index)
        cached = node_cache[:multiplication][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_operand
      s0 << r1
      if r1
        if has_terminal?('*', false, index)
          r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('*')
          r2 = nil
        end
        s0 << r2
        if r2
          r3 = _nt_operand
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Multiplication0)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:multiplication][start_index] = r0

      r0
    end

    module Addition0
      def operand1
        elements[0]
      end

      def operand2
        elements[2]
      end
    end

    def _nt_addition
      start_index = index
      if node_cache[:addition].has_key?(index)
        cached = node_cache[:addition][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_operand
      s0 << r1
      if r1
        if has_terminal?('+', false, index)
          r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('+')
          r2 = nil
        end
        s0 << r2
        if r2
          r3 = _nt_operand
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Addition0)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:addition][start_index] = r0

      r0
    end

    module Division0
      def operand1
        elements[0]
      end

      def operand2
        elements[2]
      end
    end

    def _nt_division
      start_index = index
      if node_cache[:division].has_key?(index)
        cached = node_cache[:division][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_operand
      s0 << r1
      if r1
        if has_terminal?('/', false, index)
          r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('/')
          r2 = nil
        end
        s0 << r2
        if r2
          r3 = _nt_operand
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Division0)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:division][start_index] = r0

      r0
    end

    module Substraction0
      def operand1
        elements[0]
      end

      def operand2
        elements[2]
      end
    end

    def _nt_substraction
      start_index = index
      if node_cache[:substraction].has_key?(index)
        cached = node_cache[:substraction][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      r1 = _nt_operand
      s0 << r1
      if r1
        if has_terminal?('-', false, index)
          r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('-')
          r2 = nil
        end
        s0 << r2
        if r2
          r3 = _nt_operand
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Substraction0)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:substraction][start_index] = r0

      r0
    end

    def _nt_space
      start_index = index
      if node_cache[:space].has_key?(index)
        cached = node_cache[:space][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      s0, i0 = [], index
      loop do
        if has_terminal?('\G[\\s]', true, index)
          r1 = true
          @index += 1
        else
          r1 = nil
        end
        if r1
          s0 << r1
        else
          break
        end
      end
      if s0.empty?
        @index = i0
        r0 = nil
      else
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      end

      node_cache[:space][start_index] = r0

      r0
    end

  end

  class HandlerMethodParser < Treetop::Runtime::CompiledParser
    include HandlerMethod
  end

end
