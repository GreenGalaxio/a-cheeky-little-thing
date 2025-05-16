// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blade_menu_trans

package 
{
    import flash.display.MovieClip;

    public dynamic class blade_menu_trans extends MovieClip 
    {

        public function blade_menu_trans()
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

