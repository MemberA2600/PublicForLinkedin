using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class CloudShoot : MonoBehaviour
{
    public SpriteRenderer render;
    public Sprite[] sprites;
    public AudioSource aud;
    public AudioClip[] clips;
    float counter;
    int speed;
    GameObject Marisa;
    Rigidbody2D body;
    int spriteIndex;

    // Start is called before the first frame update

    void Awake()
    {
        render = GetComponent<SpriteRenderer>();
        aud = GetComponent<AudioSource>();
        Marisa = GameObject.Find("Marisa_Player");
        body = GetComponent<Rigidbody2D>();
    }
    void Start()
    {
        aud.clip = clips[Random.Range(0, 3)];
        aud.Play();
        render.sprite = sprites[(int)Random.Range(0, sprites.Length)];


    }

    // Update is called once per frame
    void Update()
    {
        if (counter < Marisa.GetComponent<MySprite>().level*10+50)
        {
            counter += 0.05f;
            transform.position = Vector3.MoveTowards(transform.position, Marisa.GetComponent<MySprite>().transform.position, counter/15 * Time.deltaTime);

        }
        else
        {
            GameObject prefab = (GameObject)Resources.Load("Explosion");
            Instantiate(prefab, transform.position, Quaternion.identity);
            Destroy(gameObject);

        }

        /*
        if (spriteIndex < sprites.Length - 1)
        {
            spriteIndex++;
        }
        else
        {
            spriteIndex = 0;
        }
        */

    }



    void OnBecameInvisible()
    {
        Destroy(gameObject);
    }
}
