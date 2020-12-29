using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Spawn : MonoBehaviour
{

    public int enemyNumber;
    public int projectileNumber;
    public GameObject Marisa;
    private float delay;
    public List<GameObject> enemies;
    public List<GameObject> enemmy_projectiles;


    // Start is called before the first frame update
    void Awake()
    {
        delay = 0;
        enemies = new List<GameObject>();
        enemmy_projectiles = new List<GameObject>();

    }
    
    void Start()
    {
        StartCoroutine(Spawner());
    }

    IEnumerator Spawner()
    {
        while (true)
        {

            if (delay < 50)
            {
                delay++;
            }
            else
            {

                if (Random.Range(0, 200 - Marisa.GetComponent<MySprite>().level * 5) < 10 && enemyNumber < (Marisa.GetComponent<MySprite>().level * 2 + 2))
                {
                    Vector3 pos = Camera.main.ScreenToWorldPoint(new Vector3(Random.Range(25, Screen.width - 25), Screen.height, 0));
                    int r = Random.Range(0, 8 + Marisa.GetComponent<MySprite>().level);

                    if (r<6)
                    {
                        pos = new Vector3(pos.x, 5, 0);
                        GameObject prefab = (GameObject)Resources.Load("Ghost");                   
                        GameObject Last = Instantiate(prefab, pos, Quaternion.identity);
                        enemies.Add(Last);

                    }
                    else if (r>5 && r<10)
                    {
                        int rrr = Random.Range(0, 10);

                        if (rrr > 4)
                        {
                            GameObject prefab2 = (GameObject)Resources.Load("Cloud");
                            Vector3 g = Camera.main.ScreenToWorldPoint(new Vector3(50, -5, 0));
                            GameObject Last = Instantiate(prefab2, new Vector3(g.x,g.y,0), Quaternion.identity);
                            enemies.Add(Last);
                        }
                        else
                        {
                            GameObject prefab2 = (GameObject)Resources.Load("Cloud");
                            Vector3 g = Camera.main.ScreenToWorldPoint(new Vector3(Screen.width-50, -5, 0));
                            GameObject Last = Instantiate(prefab2, new Vector3(g.x, g.y, 0), Quaternion.identity);
                            Last.GetComponent<SpriteRenderer>().flipX = true;
                            enemies.Add(Last);

                        }
                        enemyNumber++;


                    }
                    enemyNumber++;
                }
            }

            yield return new WaitForSeconds(0.1f);
        }

    }


    // Update is called once per frame
    void Update()
    {

    }


}
