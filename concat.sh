#!/bin/bash

for fn in ./plan/journals/*.md; do
	cat fn >> journal.md
end

