## Aircraft Network Restructuring
### Flight Graphs and Centrality Shifts — Eastern Europe (2019 vs. 2024)

This project presents a rigorous analytical study of air traffic network restructuring across Eastern Europe and neighboring regions. Using data from the OpenSky Network, we examine how flight connectivity has evolved in response to geopolitical shifts, especially after 2022.

---

### 📌 Overview
This repository focuses on extracting and analyzing airport-to-airport flight connections for two representative weeks in September 2019 and 2024. Using SQL queries and network science, we model these connections as directed weighted graphs and measure airport importance using PageRank and Betweenness Centrality.

---

[🔗 View Dashboard](https://gantonnikov.github.io/flight-network-analysis/network_analysis_tabs.html)

---

### ⚙️ Methods
- SQL extraction from OpenSky: Weekly data filtered to complete routes
- Data enrichment via OpenFlights (ICAO ↔ country and coordinates)
- Route filtering by region and frequency (≥ 3 flights per week)
- Directed graph modeling with `networkx`
- Centrality calculations: `PageRank`, `Betweenness Centrality`
- Visualizations: Folium maps, bar plots, treemaps, scatter plots

---

### 🔍 Key Findings
- Russia lost nearly all of its structural influence in the regional network by 2024
- Turkey, Poland, and Central Europe (e.g., Czechia, Hungary) emerged as new key hubs
- The network became less centralized, with more disconnected and peripheral nodes
- Strong routes were reoriented southward and westward following airspace restrictions

---

### 📊 Outputs
- Fully reproducible notebook: `notebooks/network_analysis.ipynb`
- Interactive dashboards in `dashboards/`
- Comparative metrics and ranked lists by year
- Clean dataset versions stored in `data/`

---

### 📚 References
- [OpenSky Network](https://opensky-network.org/)
- [OpenFlights Airport Data](https://github.com/jpatokal/openflights)
- [NetworkX Library](https://networkx.org/)
- [Seaborn](https://seaborn.pydata.org/), [Folium](https://python-visualization.github.io/folium/)
