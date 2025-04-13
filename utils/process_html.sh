#!/bin/bash
# Author: Sachin Yadav
# for filepath in ./_notebooks/*.ipynb; do
#     # echo $filepath
#     filename=$(basename ${filepath})
#     # echo $filename
#     basename=${filename%.ipynb}
#     # echo $basename
#     python utils/style_html.py ./_html/$basename.html ./_html/$basename.html
# done


jupyter nbconvert --to html ./_notebooks/*.ipynb --output-dir ./_html

# Step 2: Style all the generated HTML files
for filepath in ./_notebooks/*.ipynb; do
    filename=$(basename "${filepath}")
    basename="${filename%.ipynb}"
    htmlfile="./_html/$basename.html"

    if [ -f "$htmlfile" ]; then
        echo "Styling $htmlfile"
        python utils/style_html.py "$htmlfile" "$htmlfile"
    else
        echo "⚠️  HTML file not found: $htmlfile"
    fi
done
