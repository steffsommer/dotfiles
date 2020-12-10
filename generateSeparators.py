#
#==---------------+==================+---------------==
#==---------------+==== EXAMPLE =====+---------------==
#==---------------+==================+---------------==


#==---------------+==================+---------------==
#==---------+==== VERY LONG EXAMPLE =====+-----------==
#==---------------+==================+---------------==

from math import floor


commentChar = '#'
s1 = '=+'
s2 = '-'
s3 = '+= '
lineLen = 90

def genHeader(title: str) -> str:
    s2Len = floor((lineLen - len(s1) * 2 - len(s3) * 2 - len(title)) / 2)
    genHalfLine = lambda pad: commentChar + s1 + s2 * (s2Len + 1 if pad else s2Len) + s3
    headerLineLeft = genHalfLine(False)
    headerLineRight = genHalfLine(len(title) % 2 != 0)[::-1]
    headerMiddleLine = headerLineLeft + title + headerLineRight
    header = headerMiddleLine
    return header

# debug
titles = ['GENERAL SETTINGS', 'PLUGIN SECTION', 'KEY MAPS', 'COC COMPAT SETTINGS']
for title in titles:
    print(genHeader(title))
    print(len(genHeader(title)))


