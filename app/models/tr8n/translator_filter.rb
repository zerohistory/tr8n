#--
# Copyright (c) 2010 Michael Berkovich, Geni Inc
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

class Tr8n::TranslatorFilter < Tr8n::BaseFilter

  def definition
    defs = super  
    defs[:fallback_language_id][:is] = :list
    defs[:fallback_language_id][:is_not] = :list
    defs
  end
  
  def value_options_for(criteria_key)
    if criteria_key == :fallback_language_id
      return Tr8n::Language.filter_options 
    end

    return []
  end

  def default_filters
    super + [
      ["Watchlist", "watchlist"]
    ]
  end

  def default_filter_conditions(key)
    super_conditions = super(key)
    return super_conditions if super_conditions

    case key
      when "watchlist"
        return [:reported, :is, '1']
    end
  end
  
end
