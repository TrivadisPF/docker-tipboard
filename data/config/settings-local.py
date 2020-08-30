#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function
from __future__ import unicode_literals


##############################################################################
# Stuff that can be / should be configured by Docker Environment variables


# >> END


##############################################################################
# Stuff that can be / should be overridden in local settings

# Javascript log level ('1' for 'standard', '2' for 'debug')
JS_LOG_LEVEL = 1

# We are using Sentry for catching/aggregating errors
SENTRY_DSN = ''

# Our default color palette
COLORS = {
    'black':            '#000000',
    'white':            '#FFFFFF',
    'tile_background':  '#25282d',
    'red':              '#DC5945',
    'yellow':           '#FF9618',
    'green':            '#94C140',
    'blue':             '#12B0C5',
    'violet':           '#9C4274',
    'orange':           '#EC663C',
    'naval':            '#54C5C0',
}
