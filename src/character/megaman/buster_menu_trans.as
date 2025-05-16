// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//buster_menu_trans

package 
{
    import flash.display.MovieClip;

    public dynamic class buster_menu_trans extends MovieClip 
    {

        public function buster_menu_trans()
        {
            addFrameScript(2, this.frame3);
        }

        internal function frame3():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

