using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class rainiing : MonoBehaviour
{

    public SpriteRenderer render;
    public Sprite[] sprites;
    int num;

    // Start is called before the first frame update

    void Awake()
    {
        render = GetComponent<SpriteRenderer>();

    }

    void Start()
    {
        num = 0;
        StartCoroutine(RainAnimation());
    }


    IEnumerator RainAnimation()
    {
        while (true)
        {
            if (num > sprites.Length - 2)
            {
                num = 0;
            }
            else
            {
                num++;
            }

            render.sprite = sprites[num];

            yield return new WaitForSeconds(0.05f);
        }

    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
