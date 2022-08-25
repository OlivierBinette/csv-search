# csv-search

Quickly setup elasticsearch and a web search UI for arbitrary csv tables.

🚧 Under Construction: data loading feature has not yet been implemented (only test data is used).

## Usage

1. Build the image:
    ```
    git clone https://github.com/OlivierBinette/csv-search.git
    cd csv-search
    sudo docker build -t csv-search .
    ```

2. Run it in a container:
    ```
    sudo docker run -p 3000:3000 -p 9200:9200 -it csv-search 
    ```

3. Open [http://localhost:3000](http://localhost:3000) in your browser. Note: it may take a few seconds for the website to become accessible.
