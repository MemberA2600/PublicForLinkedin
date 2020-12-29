using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class xxx : MonoBehaviour
{
    public SpriteRenderer render;

    // Start is called before the first frame update

    void Awake()
    {
        render = GetComponent<SpriteRenderer>();

    }
    void Start()
    {

        Vector3 ScreenUp = Camera.main.ScreenToWorldPoint(new Vector3(
            Screen.width/3*2,
            Screen.height + render.sprite.rect.height / 2
            ,0));

        transform.position = new Vector3(ScreenUp.x, ScreenUp.y, 0);


    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
