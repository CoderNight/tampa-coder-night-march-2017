#!/usr/bin/env python3

class Character:
    def __init__(self, c, mapping, drawn):
        self.c = c
        self.mapping = mapping
        self.drawn = drawn
        self.width = len(drawn[0])//len(mapping)
        self.index = mapping.index(c)

    def _get_line(self, n):
        return self.drawn[n][self.index * self.width:][:self.width]

    def draw_line(self, n, size):
        line = self._get_line(n)
        return ''.join((line[0],
                        ''.join(c * size for c in line[1:-1]),
                        line[-1]))

class Characters:
    def __init__(self, string, mapping, drawn):
        self.chars = tuple(Character(c, mapping, drawn) for c in string)
        self.height = len(drawn)
        self.horizontal_lines = (0, self.height//2, self.height - 1)

    def draw(self, size, separator=' '):
        for n in range(self.height):
            repeat = 1 if n in self.horizontal_lines else size
            for _ in range(repeat):
                print separator.join(c.draw_line(n, size) for c in self.chars)


def parse_args():
    import sys
    import argparse

    description='Displays LCD style numbers at adjustable sizes.'
    parser = argparse.ArgumentParser(description=description)
    parser.add_argument('-s', dest='size', metavar='size', default=2, type=int,
                        choices=range(1,21),
                        help='size of lcd characters from 1-20 (default: %(default)s)')
    parser.add_argument('string')
    return parser.parse_args(sys.argv[1:])

def main():
    args = parse_args()

    mapping = "0123456789"
    drawn = [
        " -     -  -     -  -  -  -  - ",
        "| |  |  |  || ||  |    || || |",
        "       _  -  -  -  _     -  - ",
        "| |  ||    |  |  || |  || |  |",
        " _     _  _     _  -     -  - ",
    ]
    Characters(args.string, mapping, drawn).draw(args.size)

if __name__ == '__main__':
    main()

