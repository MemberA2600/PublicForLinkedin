using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class start : MonoBehaviour
{
    public SpriteRenderer render;

    // Start is called before the first frame update

    void Awake()
    {
        render = GetComponent<SpriteRenderer>();
    }

    void Start()
    {
        transform.position = new Vector3(999, 999, 0);

    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
