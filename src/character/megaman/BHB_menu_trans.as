// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//BHB_menu_trans

package 
{
    import flash.display.MovieClip;

    public dynamic class BHB_menu_trans extends MovieClip 
    {

        public function BHB_menu_trans()
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

