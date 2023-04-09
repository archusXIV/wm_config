#!/usr/bin/env python

import imaplib
obj = imaplib.IMAP4_SSL('imap.free.fr',993)
obj.login('nofckingspamwanted@free.fr','Be142857@F.fr')
obj.select()
print(len(obj.search(None, 'UnSeen')[1][0].split()))
