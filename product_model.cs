public class Product
{

    // Add constant for the maximum and minumum price
    public const decimal MAX_PRICE = 1000000;
    public const decimal MIN_PRICE = 0;
    private int id;
    private string name;
    private decimal price;
    private int categoryId;

    public Product(int id, string name, decimal price, int categoryId)
    {
        this.id = id;
        this.name = name;
        this.price = price;
        this.categoryId = categoryId;
    }

    public int GetId()
    {
        return this.id;
    }

    public void SetId(int id)
    {
        this.id = id;
    }

    public string GetName()
    {
        return this.name;
    }

    public void SetName(string name)
    {
        if (string.IsNullOrEmpty(name))
        {
            throw new ArgumentException("Name cannot be null or empty.");
        }
        this.name = name;
    }

    public decimal GetPrice()
    {
        return this.price;
    }

    public void SetPrice(decimal price)
    {
        if (price < MIN_PRICE)
        {
            throw new ArgumentException($"Price cannot be less than the minimum price of {MIN_PRICE}.");
        }
        if (price > MAX_PRICE)
        {
            throw new ArgumentException($"Price cannot exceed the maximum price of {MAX_PRICE}.");
        }
        this.price = price;
    }

    public int GetCategoryId()
    {
        return this.categoryId;
    }

    public void SetCategoryId(int categoryId)
    {
        this.categoryId = categoryId;
    }
}