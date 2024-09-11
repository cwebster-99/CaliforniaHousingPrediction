import matplotlib.image as mpimg
import matplotlib.pyplot as plt
import numpy as np

def population_price_visual(df):
    california_img = mpimg.imread('..\images\california.png')
    df.plot(kind="scatter", x="longitude", y="latitude", figsize=(10, 7),
                 s=df['population'] / 100, label="Population",
                 c="median_house_value", cmap=plt.get_cmap("jet"),
                 colorbar=False, alpha=0.4)
    plt.imshow(california_img, extent=[-124.55, -113.80, 32.45, 42.05], alpha=0.5,
               cmap=plt.get_cmap("jet"))
    plt.ylabel("Latitude", fontsize=14)
    plt.xlabel("Longitude", fontsize=14)

    prices = df["median_house_value"]
    np.linspace(prices.min(), prices.max(), 11)

    population_price_graph = plt.show()
    return population_price_graph
