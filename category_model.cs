public class Category
{
    private int id;
    private string name;
    private string description;

    public Category(int id, string name, string description)
    {
        this.id = id;
        this.name = name;
        this.description = description;
    }

    public int GetId()
    {
        return this.id;
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

    public string GetDescription()
    {
        return this.description;
    }

    public void SetDescription(string description)
    {
        this.description = description;
    }
}