using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Projectile_Sprite : MonoBehaviour
{

    public SpriteRenderer render;
    public Sprite[] sprites;
    private int spriteIndex;
    public AudioClip sound;
    public AudioSource aud;

    // Start is called before the first frame update

    void Awake()
    {
        render = GetComponent<SpriteRenderer>();
        aud = GetComponent<AudioSource>();
        aud.clip = sound;
        spriteIndex=0;
    }
    void Start()
    {
        aud.Play();
        render.sprite = sprites[(int)Random.Range(0, sprites.Length)];

    }

    // Update is called once per frame
    void Update()
    {
        /*
        if (spriteIndex < sprites.Length-1)
        {
            spriteIndex++;
        }
        else
        {
            spriteIndex = 0;
        } 

        render.sprite = sprites[spriteIndex];*/

        Vector3 pos = Camera.main.WorldToScreenPoint(transform.position);

        if (pos.y < Screen.height)
        {
            transform.position += new Vector3(0f, 15f*Time.deltaTime, 0);

        }
        else
        {
            Destroy(gameObject);
        }
    }
}
