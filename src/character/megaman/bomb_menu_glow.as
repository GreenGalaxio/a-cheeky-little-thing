// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//bomb_menu_glow

package 
{
    import flash.display.MovieClip;

    public dynamic class bomb_menu_glow extends MovieClip 
    {

        public function bomb_menu_glow()
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

