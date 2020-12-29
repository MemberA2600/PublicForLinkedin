using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ThisIsARealThing : MonoBehaviour
{
    public AudioSource aud;
    public AudioClip[] clips;
    public SpriteRenderer render;
    public Sprite[] sprites;
    public GameObject Marisa;
    private Vector3 StartPoz;
    private Vector3 UpdatedPoz;
    private bool record;
    private float size;
    float MaxSize;
    bool reachedMax;

    private int spriteIndex;

    void Awake()
    {
        aud = GetComponent<AudioSource>();
        render = GetComponent<SpriteRenderer>();
        Marisa = GameObject.Find("Marisa_Player");
        size = 1f;
        MaxSize = (Marisa.GetComponent<MySprite>().level + 1) * 5 + 10;
    }

    // Start is called before the first frame update
    void Start()
    {
        StartPoz = transform.position;
        StartCoroutine(MoveToDirection());
        render.sprite = sprites[(int)Random.Range(0, sprites.Length)];

    }

    // Update is called once per frame
    void Update()
    {
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

    IEnumerator MoveToDirection()
    {
        while (true)
        {
            if (record == false)
            {
                transform.position = Vector3.MoveTowards(transform.position, Marisa.GetComponent<MySprite>().transform.position, (Marisa.GetComponent<MySprite>().level+1) * 10 * Time.deltaTime);
                UpdatedPoz = transform.position;
                record = true;

            }
            else
            {
                transform.position += new Vector3(
                    UpdatedPoz.x - StartPoz.x,
                    UpdatedPoz.y - StartPoz.y,
                    0
                    );
                if (reachedMax == false)
                {
                    size += 0.08f * (Marisa.GetComponent<MySprite>().level + 1);
                    if (size > MaxSize) reachedMax = true;
                }
                else
                {
                    size -= 4f * (Marisa.GetComponent<MySprite>().level + 1);
                    if (size < 4)
                    {
                        GameObject prefab = (GameObject)Resources.Load("Explosion");
                        Instantiate(prefab, transform.position, Quaternion.identity);
                        Destroy(gameObject);
                    }
                }

                transform.localScale = new Vector3(size, size, size);

            }



            yield return new WaitForSeconds(.1f);
        }
    }

    void OnBecameInvisible()
    {
        Destroy(gameObject);
    }
}

