// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//Arrow_explode

package 
{
    import flash.display.MovieClip;

    public dynamic class Arrow_explode extends MovieClip 
    {

        public function Arrow_explode()
        {
            addFrameScript(14, this.frame15);
        }

        internal function frame15():*
        {
            stop();
            if (((!(root == null)) && (!(parent == null))))
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

