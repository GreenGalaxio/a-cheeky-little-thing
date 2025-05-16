// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//marth_finalsmash_effect

package 
{
    import flash.display.MovieClip;

    public dynamic class marth_finalsmash_effect extends MovieClip 
    {

        public function marth_finalsmash_effect()
        {
            addFrameScript(41, this.frame42);
        }

        internal function frame42():*
        {
            stop();
            if (((!(root == null)) && (!(parent == null))))
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

