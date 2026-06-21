+++
title = "Tufte CSS Showcase"
date = 2016-03-30
+++

This post showcases the typography and layout features available in this theme,
adapted from [Tufte CSS](https://github.com/edwardtufte/tufte-css).

# This is a H1.

## This is a H2.

### And this is a H3.

Here is a **bold**, an *italic*, and a [hyperlink](/).

A block quote:

> But say, my brothers, what can the child do that even the lion could not do?
> Why must the preying lion still become a child? The child is innocence and
> forgetting, a new beginning, a game, a self-propelled wheel, a first movement,
> a sacred "Yes."
>
> — Friedrich Nietzsche, *Thus Spoke Zarathustra*

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
{% sidenote(id="side1") %}This is a sidenote.{% end %}
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur
{% sidenote(id="side2") %}This is another sidenote.{% end %}
sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit
anim id est laborum.

{% marginnote(id="margin1") %}This is a margin note.{% end %}

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Here is a code block
{% sidenote(id="side3") %}Syntax highlighting uses the `base16-ocean-light` theme configured in `config.toml`.{% end %}:

```python
import sys
import inspect

import pydantic
import yaml


class BaseModel(pydantic.BaseModel):
    """Extension of pydantic.BaseModel to support YAML parsing"""
    @classmethod
    def parse_yaml(cls, filepath):
        """Parse YAML file into pydantic model"""
        with open(filepath, "r") as f:
            config = yaml.safe_load(f)
        return cls.parse_obj(config)
```
