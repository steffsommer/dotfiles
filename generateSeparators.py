#
#==---------------+==================+---------------==
#==---------------+==== EXAMPLE =====+---------------==
#==---------------+==================+---------------==


#==---------------+==================+---------------==
#==---------+==== VERY LONG EXAMPLE =====+-----------==
#==---------------+==================+---------------==

from math import floor 

text = 'HELLO WORLD'

scaleFactor = 60

separatorCnt = floor(scaleFactor / 2 - len(text)) 
preFormatStr = '#=='\
        + separatorCnt * '-'\
        + '+'\
        + floor(scaleFactor / 10) * '='\
        + ' '\
        + text\
        + ' '\
        + floor(scaleFactor / 10) * '='\
        + '+'\
        + separatorCnt * '-'\
        + '=='
print(preFormatStr)

