using System.ComponentModel.DataAnnotations;

public class PortfolioPost
{
    [Key]
    public int ID { get; set; } = -1;
    
    [Required]
    [MaxLength(256)]
    public String ThumbnailImagePath { get; set; } = String.Empty;
    
    [Required]
    [MaxLength(128)]
    public String Title { get; set; } = String.Empty;
    
    [Required]
    [MaxLength(1024)]
    public String Description { get; set; } = String.Empty;
}