using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class yyy : MonoBehaviour
{
    public SpriteRenderer render;

    // Start is called before the first frame update

    void Awake()
    {
        render = GetComponent<SpriteRenderer>();
    }
    void Start()
    {

        Vector3 ScreenLeft = Camera.main.ScreenToWorldPoint(new Vector3(
            0 - render.sprite.rect.width / 3,
            render.sprite.rect.height/5,
            0));

        transform.position = new Vector3(ScreenLeft.x, ScreenLeft.y, 0);
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void OnCollisionEnter2D(Collision2D col)
    {

        if (col.gameObject == GameObject.Find("Logo"))
        {
            GameObject.Find("Shinto").GetComponent<Menu>().collided = true;
        }
    }
}
