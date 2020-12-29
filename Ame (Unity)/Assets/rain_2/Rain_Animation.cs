using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Rain_Animation : MonoBehaviour
{
    public SpriteRenderer render;
    public Sprite[] sprites;
    int pointer;

    // Start is called before the first frame update
    void Awake()
    {
        render = GetComponent<SpriteRenderer>();

    }

    void Start()
    {
        StartCoroutine(Rain());
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    IEnumerator Rain()
    {
        while (true)
        {
            if (pointer > sprites.Length - 2)
            {
                pointer = 0;
            }
            else
            {
                pointer++;
            }

            render.sprite = sprites[pointer];

            yield return new WaitForSeconds((float)0.02);
        }
    }

}
