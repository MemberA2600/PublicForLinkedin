using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bar : MonoBehaviour
{
    // Start is called before the first frame update

    public SpriteRenderer render;
    public Sprite[] sprites;

    void Awake()
    {
        render = GetComponent<SpriteRenderer>();
    }

    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
